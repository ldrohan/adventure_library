class LibraryWorker
	include Sidekiq::Worker
	
	def perform(library_id)
    library = Library.find(library_id)
    response1 = Typhoeus.get("#{library.url}/libraries.json")
    result = JSON.parse(response1.body)
    result["libraries"].each do |url_link|
        if Library.find_by_url(url_link["url"])
        else
          @library = Library.new
          @library.url = url_link["url"]
          @library.save
        end
    end
  end

end
