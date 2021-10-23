switch ReactDOM.querySelector("#root") {
| None => ()
| Some(elem) => ReactDOM.render(<React.StrictMode> <App /> </React.StrictMode>, elem)
}
