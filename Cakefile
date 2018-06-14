{exec} = require("child_process")
fs = require("fs")

task("build", "Build tgForms.js", ->
  coffee = fs.readFileSync("tgForms.coffee", "utf8")

  head = coffee.replace(/templates = {}(.|\n)*$/, "templates = {}")
  tail = coffee.replace(/^(.|\n)*templates = {}/, "")

  for file in fs.readdirSync("templates")
    mustache = fs.readFileSync("templates/" + file, "utf8")

    key = "tgforms:" + file.replace(/.mst$/, "")

    value = mustache.replace(/\n$/, "")
    value = value.replace(/"/g, "\\\"")
    value = value.replace(/\n/g, "\\n\n")
    value = "\"" + value + "\""

    declaration = "  templates[\"" + key + "\"] = " + value
    declaration = declaration.replace(/\n/g, "\n  ")

    head = head + "\n\n" + declaration

  fs.mkdirSync("build") if not fs.existsSync("build")
  fs.writeFileSync("build/tgForms.coffee", head + tail, "utf8")

  exec("coffee -bc build/tgForms.coffee", (err, stdout, stderr) ->
    throw err if err
    console.log(stdout + stderr)
  )
)

task("clean", "Clean build directory", ->
  fs.unlinkSync("build/tgForms.coffee") if fs.existsSync("build/tgForms.coffee")
  fs.unlinkSync("build/tgForms.js") if fs.existsSync("build/tgForms.js")
  fs.unlinkSync("build/tgForms.min.js") if fs.existsSync("build/tgForms.min.js")
  fs.rmdirSync("build") if fs.existsSync("build")
)

task("minify", "Minify tgForms.js", ->
  exec("java -jar compiler.jar --js build/tgForms.js --js_output_file build/tgForms.min.js", (err, stdout, stderr) ->
    throw err if err
    console.log(stdout + stderr)
  )
)
