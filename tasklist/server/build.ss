#! eqela ss-0.21

lib sling-tools:0.34.0
import sling.tools.compiler
SlingCompilerTool.forSushiApplicationDirectory("app").executeScript(args)
