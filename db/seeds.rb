test_user = User.create(email: "test@mail.com", password: "123456")

contacts = [
          { name: 'Andrew Clark', email: 'andrew@react.com', number: '975318642',
            relation: 'Work' },
          { name: 'Brian Vaughn', email: 'brian@react.com', number: '987654321',
            relation: 'Friends' },
          { name: 'Dan Abramov', email: 'dan@react.com', number: '123456789', relation: 'Friends' },
          { name: 'Dominic Gannaway', email: 'dominic@react.com', number: '135792468',
            relation: 'Acquaintance' },
          { name: 'Luna Ruan', email: 'luna@react.com', number: '222333444', relation: 'Work' }
        ]

contacts.each { |contact| test_user.contacts.create(contact) }