@react.component
let make = () => {
  let route = Route.useRoute()

  <div className="p-4">
    {switch route {
    | Main => <Main />
    | HanziPyramid => <HanziPyramid />
    | SpeechRecognition => <SpeechRecognition />
    | SpeechSynthesis => <SpeechSynthesis />
    | NotFound => <NotFound />
    }}
  </div>
}
