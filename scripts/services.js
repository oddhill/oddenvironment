const exec = require('child_process').exec
const services = {
  'apache': {
    'start': 'sudo apachectl start',
    'stop': 'sudo apachectl stop',
    'restart': 'sudo apachectl restart'
  },
  'dnsmasq': {
    'start': 'sudo brew services start dnsmasq',
    'stop': 'sudo brew services stop dnsmasq',
    'restart': 'sudo brew services restart dnsmasq'
  },
  'mysql': {
    'start': 'brew services start mysql56',
    'stop': 'brew services stop mysql56',
    'restart': 'brew services restart mysql56'
  },
  'solr': {
    'start': 'solr start',
    'stop': 'solr stop'
  },
  'postfix': {
    'start': 'sudo postfix start',
    'stop': 'sudo postfix stop'
  }
}

const args = process.argv

if (args[2] === 'list') {
  for (var s in services) {
    var yay = s + ': '

    for (var c in services[s]) {
      yay += c + ', '
    }

    console.log(yay);
  }
  process.exit(0);
}

if (args.length !== 4) {
  console.error('Missing args.')
  process.exit(1);
}

const service = args[2]
const todo = args[3]

if (!services[service]) {
  console.error('Unable to find the service.')
  process.exit(1)
}

if (!services[service][todo]) {
  console.error('That is not a valid command.')
  process.exit(1)
}

const cmd = services[service][todo]

exec(cmd, function (err, stdout, stdin) {
  if (!err) {
    console.log('Success!')
    process.exit(0)
  } else {
    console.error('Something went wrong :(')
    process.exit(1)
  }
})
