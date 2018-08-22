discard """
  exitcode: 0,
  output: "hello world"
"""

import asyncdispatch
import asyncfile
import times

var asyncStdout = 1.AsyncFD.newAsyncFile()
proc doStuff: Future[void] {.async.} =
  await asyncStdout.write "hello world\n"

var start = epochTime()
let fut = doStuff()
doAssert fut.finished, "Poll is needed unnecessarily. See #6846."