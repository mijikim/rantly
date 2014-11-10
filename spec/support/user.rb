def create_user(overrides = {})
  u = User.new ({
    id: 0,
    email: "test@example.com",
    username: "Test",
    password: "password",
    first_name: "Rantly",
    last_name: "Test",
    bio: "Test Bio",
    rant_frequency: "Daily",
    activated: true
  })
  u.save(validate: false)
  u
end

def create_different_user(overrides = {})
  u = User.new ({
    id: 1,
    email: "test1@example.com",
    username: "Test1",
    password: "password",
    first_name: "Rick",
    last_name: "Walker",
    bio: "Test Bio",
    rant_frequency: "Daily",
    activated: true
  })
  u.save(validate: false)
  u
end