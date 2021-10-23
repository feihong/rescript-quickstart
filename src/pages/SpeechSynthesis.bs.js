// Generated by ReScript, PLEASE EDIT WITH CARE

import * as RR from "../utils/RR.bs.js";
import * as $$Array from "../utils/Array.bs.js";
import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as Button from "../widgets/Button.bs.js";
import * as Select from "../widgets/Select.bs.js";

var voices = window.speechSynthesis.getVoices();

function speak(utterance) {
  window.speechSynthesis.speak(utterance);
  
}

var Speech = {
  voices: voices,
  speak: speak
};

var litany = "I must not fear.\nFear is the mind-killer.\nFear is the little-death that brings total obliteration.\nI will face my fear.\nI will permit it to pass over me and through me.\nAnd when it has gone past, I will turn the inner eye to see its path.\nWhere the fear has gone there will be nothing. Only I will remain.";

function SpeechSynthesis(Props) {
  var match = React.useState(function () {
        return $$Array.getExn(voices, 0);
      });
  var setVoice = match[1];
  var voice = match[0];
  var match$1 = React.useState(function () {
        return litany;
      });
  var setText = match$1[1];
  var text = match$1[0];
  return React.createElement("div", undefined, React.createElement(Select.make, {
                  value: voice,
                  isEqual: (function (a, b) {
                      return a.name === b.name;
                    }),
                  onChange: (function (v) {
                      return Curry._1(setVoice, (function (param) {
                                    return v;
                                  }));
                    }),
                  children: voices.map(function (voice) {
                        return React.createElement(Select.Item.make, {
                                    label: voice.name + " (" + voice.lang + ")",
                                    value: voice,
                                    key: voice.name
                                  });
                      })
                }), React.createElement(Button.make, {
                  onClick: (function (param) {
                      var utterance = new SpeechSynthesisUtterance(text);
                      utterance.voice = voice;
                      window.speechSynthesis.speak(utterance);
                      
                    }),
                  children: RR.s("Speak")
                }), React.createElement("div", undefined, React.createElement("textarea", {
                      cols: 60,
                      rows: 7,
                      value: text,
                      onChange: (function (evt) {
                          return Curry._1(setText, (function (param) {
                                        return evt.currentTarget.value;
                                      }));
                        })
                    })));
}

var make = SpeechSynthesis;

export {
  Speech ,
  litany ,
  make ,
  
}
/* voices Not a pure module */
