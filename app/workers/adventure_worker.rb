class AdventureWorker
  include Sidekiq::Worker
  def perform(library_id)
    library = Library.find(library_id)
    response1 = Typhoeus.get("#{library.url}/adventures.json")
    result = JSON.parse(response1.body)
    result["adventures"].each do |adventure|
      scraped_adventure = library.adventures.create!(:title => adventure["title"], :author => adventure["author"], :guid => adventure["guid"])


      adventure["pages"].each do |page|
        scraped_pages = scraped_adventure.pages.create!(:name => page["name"], :text => page["text"])
      end

    end
  end
end
