// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as $$Option from "../utils/Option.bs.js";
import * as Pervasives from "rescript/lib/es6/pervasives.js";

function fs(prim) {
  return prim.toString();
}

function Slider(Props) {
  var value = Props.value;
  var min = Props.min;
  var max = Props.max;
  var step = Props.step;
  var onChange = Props.onChange;
  return React.createElement("input", {
              max: max.toString(),
              min: min.toString(),
              step: step,
              type: "range",
              value: value.toString(),
              onChange: (function (evt) {
                  return $$Option.forEach(Pervasives.float_of_string_opt(evt.currentTarget.value), onChange);
                })
            });
}

var make = Slider;

export {
  fs ,
  make ,
  
}
/* react Not a pure module */