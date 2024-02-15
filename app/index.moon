lapis = require "lapis"

class extends lapis.Application
  @enable "etlua"
  [index: "/"]: => @html ->
    div ->
      h1 style: "color: blue;", "Hello, world!"
      for i=1,3
        a href: '/template', "Template #{i}"
        br!

  [template: "/template"]: =>
    render: true -- same as `render: 'template'`
