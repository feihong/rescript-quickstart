module Link = {
  @react.component
  let make = (~route: Route.t, ~children) => {
    let path = Route.getPath(route)
    <li> <a href=path> children </a> </li>
  }
}

@react.component
let make = () =>
  <div>
    <H1> {"Feihong's ReScript Quickstart"->RR.s} </H1>
    <p className="mb-4"> {`欢迎你来看我的示范！`->RR.s} </p>
    <ul className="list-inside list-disc">
      <Link route=HanziPyramid> {"Hanzi pyramid"->RR.s} </Link>
      <Link route=WidgetsDemo> {"Widgets demo"->RR.s} </Link>
      <Link route=SpeechSynthesis> {"Speech synthesis"->RR.s} </Link>
      <Link route=SpeechRecognition> {"Speech recognition (JS)"->RR.s} </Link>
      <li> {"Time talk"->RR.s} </li>
      <li> {"Music player"->RR.s} </li>
      <li> {"Vocab quiz"->RR.s} </li>
    </ul>
  </div>
