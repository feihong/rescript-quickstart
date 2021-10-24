import React, { useState } from 'react'

const SpeechRecognition = window.webkitSpeechRecognition || null

function makeRecognizer(lang, onResult) {
  if (!SpeechRecognition) return null

  const recognition = new SpeechRecognition()
  recognition.lang = lang
  recognition.onresult = evt => {
    console.log(evt.results)
    onResult(evt.results[0][0])
  }
  return recognition
}

export default function () {
  const [result, setResult] = useState(null)

  let recognition = makeRecognizer('zh-CN', result => setResult(result))

  return <div> {recognition === null
    ? "Speech recognition is not supported on this browser"
    : <div>
        <button className="bg-blue-500 hover:bg-blue-700 text-white rounded p-1"
          onClick={_ => {
            setResult(null)
            recognition.start()}}> {"Start recognition"} </button>
        {result && <div> {`Transcript: ${result.transcript}, Confidence: ${result.confidence}`} </div>}
      </div>}
  </div>
}
