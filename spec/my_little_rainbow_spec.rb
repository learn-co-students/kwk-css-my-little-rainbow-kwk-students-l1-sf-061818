RSpec.describe 'Navigation and Nested Elements' do
  it 'begins with a valid doctype' do
    expect(parsed_html.children.first).to be_html5_dtd, "Make sure to include <!DOCTYPE html> in your file"
  end

  it 'has a top-level <html> tag to enclose the document' do
    expect(parsed_html.child.name).to eq('html'), "All well-structured HTML documents need an <html> tag"

    expect(html_file_contents).to include('</html>'), "Don't forget the closing </html> tag!"
  end

  context 'within <html>' do
    it 'contains a <head> tag to enclose the header' do
      head = parsed_html.search('html > head').first

      expect(head.name).to eq('head'), "Always include a <head> tag in your HTML pages"

      expect(html_file_contents).to include('</head>'), "Don't forget the closing </head> tag!"
    end

    context 'within <head>' do
      it 'contains a <link> tag to our main.css file' do
        link = parsed_html.search('html > head > link').first

        expect(link.name).to eq('link'), "We need a <link> in our <head> section to connect our css"

      end
    end
  end

  context 'within <html>' do
    it 'contains a <body> tag to enclose the body of the document' do
      body = parsed_html.search('html > body').first

      expect(body.name).to eq('body'), "Every HTML page needs a <body> tag"

      expect(html_file_contents).to include('</body>'), "Don't forget the closing </body> tag!"
    end

    context 'within <body>' do
      it 'contains a <div> tag with an id of "red" ' do
        red_div = parsed_html.search('#red').first
      
      end

      it 'contains a <div> tag with an id of "orange" ' do
        orange_div = parsed_html.search('#orange').first
       
      end

      it 'contains a <div> tag with an id of "yellow" ' do
        yellow_div = parsed_html.search('#yellow').first
        
      end

      it 'contains a <div> tag with an id of "green" ' do
        green_div = parsed_html.search('#green').first
       
      end

      it 'contains a <div> tag with an id of "blue" ' do
        blue_div = parsed_html.search('#blue').first
     
      end

      it 'contains a <div> tag with an id of "indigo" ' do
        indigo_div = parsed_html.search('#indigo').first
      
      end

      it 'contains a <div> tag with an id of "violet" ' do
        violet_div = parsed_html.search('#violet').first
      
  
      end
    end

  end

  context 'w3c validation' do
    it 'is a valid w3c document' do
      validator = W3CValidators::NuValidator.new
      html = File.read('./index.html')
      results = validator.validate_text(html)

      error_messages = "Expected a valid w3c document but got:\n#{results.errors.collect{|e| e.to_s}.join("\n")}"

    end
  end
end
