const imbac = require('imba/dist/compiler.js')
const fs = require('fs')

module.exports = (on) => {
    on('file:preprocessor', async (file) => {
        var source = fs.readFileSync(file.filePath, { encoding: 'utf-8'})
        var {js, _} = imbac.compile(source, { evaling: true })
        fs.writeFileSync(file.outputPath + '.js', js)
        return file.outputPath + '.js'
    })
}