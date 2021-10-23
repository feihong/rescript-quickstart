type t =
  | Main
  | HanziPyramid
  | NotFound

let useRoute = () => {
  let url = RescriptReactRouter.useUrl()

  switch url.path {
  | list{} => Main
  | list{"hanzi-pyramid"} => HanziPyramid
  | _ => NotFound
  }
}

let getPath = t =>
  switch t {
  | Main => ""
  | HanziPyramid => "hanzi-pyramid"
  | _ => ""
  }
