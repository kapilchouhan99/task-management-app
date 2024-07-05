users = User.create([{ email: 'test@example.com', password: '123456', password_confirmation: '123456' }, { email: 'sample@example.com', password: '123456', password_confirmation: '123456' }])

Task.create([{title: 'test task', description: 'test description', status: 'Backlog', deadline: Date.tomorrow, user: users.first}, {title: 'sample task', description: 'sample description', status: 'Backlog', deadline: Date.tomorrow, user: users.first}])
