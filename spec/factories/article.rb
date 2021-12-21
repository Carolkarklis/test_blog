FactoryBot.define do
  factory :article do
    title  { "An article here" }
    body { 
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer placerat nibh vitae nisl commodo laoreet. Sed iaculis, tellus vitae mollis tincidunt, felis nunc tempor sem, id congue massa neque nec justo."
    }
  end
end
