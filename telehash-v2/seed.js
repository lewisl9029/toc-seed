#!/usr/bin/env node

var tele = require("./index.js");
var fs = require("fs");
var path = require("path-extra");
var argv = require("optimist")
  .default("port", 42424)
  .default("bridge", true)
  .boolean("v").describe("v", "verbose")
  .boolean("nolan").describe("nolan", "disable lan usage")
  .argv;

if(argv.v) tele.debug(console.log);
tele.info(function(){console.log.apply(console,arguments)});

if(argv.port == 42420)
{
  console.log("that port is reserved");
  process.exit(1);
}

// localize our id file
//EDIT: reading from env var rather than file when available
// argv.id = (argv.id) ? path.resolve(argv.id) : path.join(path.homedir(),".seed.json");
// if(argv.seeds) argv.seeds = path.resolve(argv.seeds);

if (process.env.TOC_TELEHASH_KEYPAIR) {
  argv.id = JSON.parse(process.env.TOC_TELEHASH_KEYPAIR);
} else {
  argv.id = (argv.id) ? path.resolve(argv.id) : path.join(path.homedir(),".seed.json");
}

if (process.env.TOC_TELEHASH_SEEDS) {
  argv.seeds = JSON.parse(process.env.TOC_TELEHASH_SEEDS);
} else {
  if(argv.seeds) argv.seeds = path.resolve(argv.seeds);
}

tele.init(argv, function(err, seed){
  if(!seed) return console.log("something went wrong :(",err) || process.exit(1);
  var info = {paths:seed.paths, parts:seed.parts, keys:seed.keys};

  var seeds = {};
  seeds[seed.hashname] = info;
  console.log(JSON.stringify(seeds,null,2));
  console.log("connected to "+Object.keys(seed.lines).length+" mesh seed peers");
});
