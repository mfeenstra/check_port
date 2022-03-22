# check_port

A ruby script and class for checking TCP socket availability.

-----

## Examples:

###  1. As a Script:

```sh

matt@docker-dev:0:~/tmp/check_port$ check_port localhost 22; echo $?
localhost:22 open? true
0
matt@docker-dev:0:~/tmp/check_port$ check_port localhost 23; echo $?
localhost:23 open? false
1

```

### 2. As a Class:

From `irb`:

```ruby

>> res = CheckPort.new('localhost', 22)
   ==>#<CheckPort:0x0000000001c77d78 @host="localhost", @port=22, @status=true>
>> res.status
   ==>true
>> res = CheckPort.new('localhost', 23)
   ==>#<CheckPort:0x0000000001ca21b8 @host="localhost", @port=23, @status=false>
>> res.status
   ==>false

```

------

matt.a.feenstra@gmail.com
