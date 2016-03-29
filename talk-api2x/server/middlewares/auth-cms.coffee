limbo = require 'limbo'
db = limbo.use 'talk'
{UserModel} = db
Err = require 'err1st'

adminEmails = [
  'jingxin@teambition.com'
  'junyuan@teambition.com'
  'qiang@teambition.com'
  'ying@teambition.com'
  'zhuoqun@teambition.com'
  'bin@teambition.com'
  'yilin@teambition.com'
]

auth = (options = {}) ->

  _auth = (req, res, callback) ->
    {_sessionUserId} = req.get()
    return callback(new Err('NOT_LOGIN')) unless _sessionUserId
    UserModel.findOne _id: _sessionUserId
    , (err, user) ->
      unless user?.globalRole is 'admin' or user?.emailForLogin in adminEmails
        return callback(new Err('NO_PERMISSION'))
      req.set 'user', user
      callback()

module.exports = auth
