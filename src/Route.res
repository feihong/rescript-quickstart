type t =
  | Main
  | HanziPyramid
  | SpeechRecognition
  | NotFound

let useRoute = () => {
  let url = RescriptReactRouter.useUrl()

  switch url.path {
  | list{} => Main
  | list{"hanzi-pyramid"} => HanziPyramid
  | list{"speech-recognition"} => SpeechRecognition
  | _ => NotFound
  }
}

let getPath = t =>
  switch t {
  | Main => ""
  | HanziPyramid => "hanzi-pyramid"
  | SpeechRecognition => "speech-recognition"
  | _ => ""
  }
