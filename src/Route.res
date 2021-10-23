type t =
  | Main
  | HanziPyramid
  | SpeechRecognition
  | SpeechSynthesis
  | NotFound

let useRoute = () => {
  let url = RescriptReactRouter.useUrl()

  switch url.path {
  | list{} => Main
  | list{"hanzi-pyramid"} => HanziPyramid
  | list{"speech-recognition"} => SpeechRecognition
  | list{"speech-synthesis"} => SpeechSynthesis
  | _ => NotFound
  }
}

let getPath = t =>
  switch t {
  | Main => ""
  | HanziPyramid => "hanzi-pyramid"
  | SpeechRecognition => "speech-recognition"
  | SpeechSynthesis => "speech-synthesis"
  | _ => ""
  }
