namespace :sample_task do
  desc "taro君を生成する"
  task create: :environment do
    User.create(name: 'taro')
  end
end
