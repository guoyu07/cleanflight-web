module ChangeLocalMdLinksToHtml
  class Generator < Jekyll::Generator
    def initialize(base)
      @base_dir  = base
    end
    def generate(site)
      site.posts.each { |p| rewrite_links(site, p) }
    end
    def rewrite_links(site, post)
      post.content = post.content.gsub(/\(([^)]+)\.md\)/){"(#{@base_dir}docs/#{$1.downcase.gsub(/_|\P{Word}/, '-').gsub(/-{2,}/, '-')}/)"}
    end
  end
end