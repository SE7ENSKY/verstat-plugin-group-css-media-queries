module.exports = (next) ->
	groupCssMediaQueries = require 'group-css-media-queries'
	@postprocessor 'group-css-media-queries',
		extname: '.css'
		priority: 50
		postprocess: (file, donePostprocessor) =>
			return donePostprocessor() unless file['group-css-media-queries']
			try
				if file.processor
					file.processed = groupCssMediaQueries file.processed
				else
					file.source = groupCssMediaQueries file.source
				@modified file
				donePostprocessor()
			catch err
				donePostprocessor err

	next()