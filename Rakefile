drafts_dir = 'app/sources/_drafts'
posts_dir  = 'app/sources/_posts'

styles_dir  = 'app/sources/styles'
scripts_dir = 'app/sources/scripts'

desc 'Create a new post with "rake post[\'post title\']"'
task :post, :title do |_, args|
  if args.title
    title = args.title
  else
    puts 'Please try again. Remember to include the filename.'
  end
  mkdir_p "#{posts_dir}"
  file_name = "#{posts_dir}/#{Time.now.strftime('%Y-%m-%d')}-#{title.downcase.gsub(/[^\w]+/, '-')}.md"
  puts "Creating new post: #{file_name}"
  File.open(file_name, 'w') do |file|
    file << <<-EOS.gsub(/^    /, '')
    ---
    layout: post
    title: #{title}
    date: #{Time.new.strftime('%Y-%m-%d %H:%M')}
    categories:
    ---

    EOS
  end
end

desc 'Create a new draft post with "rake draft[\'draft title\']"'
task :draft, :title do |_, args|
  if args.title
    title = args.title
  else
    puts 'Please try again. Remember to include the filename.'
  end
  mkdir_p "#{drafts_dir}"
  file_name = "#{drafts_dir}/#{title.downcase.gsub(/[^\w]+/, '-')}.md"
  puts "Creating new draft: #{file_name}"
  File.open(file_name, 'w') do |file|
    file << <<-EOS.gsub(/^    /, '')
    ---
    layout: post
    title: #{title}
    date: #{Time.new.strftime('%Y-%m-%d %H:%M')}
    categories:
    ---

    EOS
  end
end

desc 'Preview the site with drafts'
task :preview do
  mkdir_p "#{styles_dir}"
  mkdir_p "#{scripts_dir}"
  puts '## Generating site'
  puts '## Stop with ^C ( <CTRL>+C )'
  system 'bundle exec jekyll serve --config ./etc/config.yml --watch --drafts'
end

desc 'List tasks'
task :tasks do
  system 'bundle exec rake -T'
end
