FactoryGirl.define do
	factory :user do
		email "user@example.com"
		password "password"
		password_confirmation "password"
	end

	factory :salon do
		address "351 Address Pl, City, State 00000" 
		name "Salon Name" 
		description "This is the description of the salon" 
		website "www.salonsample.com" 
		phone_number "111-111-1111"
	end

	factory :invalid_salon, parent: :salon do
		name nil
		address nil
	end

	factory :updated_salon, parent: :salon do
		address "New Address"
		name "New name" 
		description "This is the new description" 
		website "www.newwebsite.com" 
		phone_number "222-222-2222"
	end

	factory :video do
		link "www.youtube.com/watch?v=ZRoRYdoi2TM"
	end

	factory :invalid_video, parent: :video do
		link "www.jlkj.com"
	end

	factory :updated_video, parent: :video do
		link "www.youtube.com/watch?v=cRU9BT9M9Iw"
	end

	factory :blog do
		feed "http://www.naturalhairrules.com/feed/"
	end

	factory :invalid_blog, parent: :blog do
		feed nil
	end

	factory :updated_blog, parent: :blog do
		feed "http://blackgirllonghair.com/feed/"
	end
end