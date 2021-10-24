module SpeechRecognitionDemoJs = {
  @module("./pages/speech.jsx") @react.component
  external make: React.element = "default"
}

@react.component
let make = () => {
  let route = Route.useRoute()

  <div className="p-4 h-full">
    {switch route {
    | Main => <Main />
    | HanziPyramid => <HanziPyramid />
    | SpeechRecognition => <SpeechRecognitionDemoJs />
    | SpeechSynthesis => <SpeechSynthesisDemo />
    | WidgetsDemo => <WidgetsDemo />
    | NotFound => <NotFound />
    }}
  </div>
}
