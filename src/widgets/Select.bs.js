// Generated by ReScript, PLEASE EDIT WITH CARE

import * as RR from "../utils/RR.bs.js";
import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as Belt_Option from "rescript/lib/es6/belt_Option.js";
import * as Caml_option from "rescript/lib/es6/caml_option.js";

function Select$Item(Props) {
  var label = Props.label;
  var onClick = Props.onClick;
  return React.createElement("option", {
              onClick: (function (param) {
                  return Belt_Option.forEach(onClick, (function (onClick) {
                                return Curry._1(onClick, undefined);
                              }));
                })
            }, RR.s(label));
}

var Item = {
  make: Select$Item
};

function Select(Props) {
  var value = Props.value;
  var isEqual = Props.isEqual;
  var onChange = Props.onChange;
  var children = Props.children;
  return React.createElement("select", undefined, React.Children.map(children, (function (elem) {
                    var props = elem.props;
                    return React.cloneElement(elem, {
                                onClick: (function (param) {
                                    var itemValue = props.value;
                                    if (itemValue === undefined) {
                                      return ;
                                    }
                                    var itemValue$1 = Caml_option.valFromOption(itemValue);
                                    if (!Curry._2(isEqual, itemValue$1, value)) {
                                      return Curry._1(onChange, itemValue$1);
                                    }
                                    
                                  })
                              });
                  })));
}

var make = Select;

export {
  Item ,
  make ,
  
}
/* react Not a pure module */