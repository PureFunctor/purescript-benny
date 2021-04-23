"use strict";

const benny = require("benny");

exports.addImpl = function(name) {
  return function(test) {
    return function() {
      return benny.add(name, test);
    };
  };
};

exports.addOnlyImpl = function(name) {
  return function(test) {
    return function() {
      return benny.add.only(name, test);
    };
  };
};

exports.addSkipImpl = function(name) {
  return function(test) {
    return function() {
      return benny.add.skip(name, test);
    };
  };
};

exports.cycleImpl = function(fn_) {
  return function() {
    if (fn_ === null) {
      return benny.cycle();
    };
    return benny.cycle(function(caseResult, summary) {
      return fn_(caseResult, summary);
    });
  };
};

exports.completeImpl = function(fn_) {
  return function() {
    if (fn_ === null) {
      return benny.complete();
    };
    return benny.complete(function(summary) {
      return fn_(summary)();
    });
  };
};

exports.saveImpl = function(options) {
  return function() {
    return benny.save(options);
  };
};

exports.suiteImpl = function(name) {
  return function(suiteFns) {
    return function() {
      return benny.suite(name, ...suiteFns);
    };
  };
};
