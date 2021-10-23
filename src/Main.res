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
    <h1 className="text-4xl"> {"Feihong's RescriptReact Quickstart"->RR.s} </h1>
    <p> {`欢迎你来看我的示范！`->RR.s} </p>
    <ul className="list-inside list-disc">
      <Link route=HanziPyramid> {"Hanzi pyramid"->RR.s} </Link>
      <Link route=SpeechRecognition> {"Speech recognition"->RR.s} </Link>
      <li> {"Chengyu quiz"->RR.s} </li>
    </ul>
  </div>
