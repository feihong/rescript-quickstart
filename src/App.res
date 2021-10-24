@react.component
let make = () => {
  let route = Route.useRoute()

  <div className="p-4 h-full">
    {switch route {
    | Main => <Main />
    | HanziPyramid => <HanziPyramid />
    | SpeechRecognition => <SpeechRecognitionDemo />
    | SpeechSynthesis => <SpeechSynthesisDemo />
    | WidgetsDemo => <WidgetsDemo />
    | NotFound => <NotFound />
    }}
  </div>
}
