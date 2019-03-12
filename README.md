<h1>sign-addon no-dependencies</h1>
github.com/mozilla/sign-addon with all the dependencies included, <br/>
and a more simplified example, <br/>
and a helpful CMD-batch file to wrap the NodeJS functionality. <br/>
<br/>
JWT_ISSUER and JWT_SECRET are stored in txt files (dummy values included). <br/>
You need to generate your own credentials and run the 'example.cmd'. <br/>
(Delete it afterwards from https://addons.mozilla.org/en-GB/developers/addon/nothing/versions ).
<hr/>

running <code>example.cmd</code>, will give you something like this:
<pre>
call "node.exe" "index.js" "user:0a1b2:c4d" "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef" "C:\sign-addon\nothing.xpi" "22.22.22.22" "nothing@eladkarako.com"


[ 'user:0a1b2:c4d',
  '0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef',
  'C:\\sign-addon\\nothing.xpi',
  '22.22.22.22',
  'nothing@eladkarako.com' ]


Validating add-on [     .                                                                     ]
Validating add-on [     .       .                                                             ]
Validating add-on [     .       .        .                                                    ]
Validating add-on [     ..      .        .                                                    ]
Validating add-on [     ..      .        .                                                .   ]
Validating add-on [     ..      .        .                                               ..   ]
Validating add-on [   . ..      .        .                                               ..   ]
Validating add-on [   . ..     ..        .                                               ..   ]
Validating add-on [   . ..     ..        .                                        .      ..   ]
Validating add-on [   . ..     ..        .                                        .      .. . ]
Validating add-on [  .. ..     ..        .                                        .      .. . ]
Validating add-on [  .. ..     ..        .                                .       .      .. . ]
Validating add-on [  .. ..     ..     .  .                                .       .      .. . ]
Validating add-on [  .. ..     ..     .  .                       .        .       .      .. . ]
Validating add-on [  .. ..     ..     .  .                       .  .     .       .      .. . ]
Validating add-on [  .. ..     ..     .  .     .                 .  .     .       .      .. . ]
Validating add-on [  .. ..     ..     .  .     .                 .  .     .   .   .      .. . ]
Validating add-on [  .. ..     ..     .  .    ..                 .  .     .   .   .      .. . ]
Validating add-on [  .. ..  .  ..     .  .    ..                 .  .     .   .   .      .. . ]
Validating add-on [  .. ..  .  ..     .  .    ..                 .  .     .   .   .     ... . ]
Validating add-on [  .. ..  .  ..     .  .    ..                 .  .     .   .   .     ... ..]
Validating add-on [  .. ..  .  ..     .  . .  ..                 .  .     .   .   .     ... ..]
Validating add-on [  .. ..  .  ..     . .. .  ..                 .  .     .   .   .     ... ..]
Validating add-on [  .. ..  . ...     . .. .  ..                 .  .     .   .   .     ... ..]
Validating add-on [  .. ..  .....     . .. .  ..                 .  .     .   .   .     ... ..]
Validating add-on [  .. ..  .....     . .. .  ..         .       .  .     .   .   .     ... ..]
Validating add-on [  .. ..  .....     . .. .  ..         .       .  .  .  .   .   .     ... ..]
Validating add-on [  .. ..  .....     . .. .  ..         . .     .  .  .  .   .   .     ... ..]
Validating add-on [  .. ..  .....     . .. .  ..         . .     .  .. .  .   .   .     ... ..]
Validating add-on [  .. ..  .....     .... .  ..         . .     .  .. .  .   .   .     ... ..]
Validating add-on [  .. ..  .....     .... .  ..         . .     .  .. .  .   .   .    .... ..]
Validating add-on [  .. ..  .....     .... .  ..         . .     .  .. .  .   .   . .  .... ..]
Validating add-on [  .. ..  .....     .... .  ..         . .     .  .. .  .   .  .. .  .... ..]
Validating add-on [  .. ..  .....     .... .  ...        . .     .  .. .  .   .  .. .  .... ..]
Validating add-on [  .. ..  .....     .... .  ...        . .     .  ....  .   .  .. .  .... ..]
Validating add-on [  .. ..  .....     .... .  ...     .  . .     .  ....  .   .  .. .  .... ..]
Validating add-on [ ... ..  .....     .... .  ...     .  . .     .  ....  .   .  .. .  .... ..]
Validating add-on [ ... ..  ..... .   .... .  ...     .  . .     .  ....  .   .  .. .  .... ..]
Validating add-on [ ... ..  ..... .   .... .  ...     .  . .     .  ....  .   . ... .  .... ..]
Validating add-on [.... ..  ..... .   .... .  ...     .  . .     .  ....  .   . ... .  .... ..]
Validating add-on [.... ..  ..... .   .... .  ...     .  . . .   .  ....  .   . ... .  .... ..]
Validating add-on [...........................................................................]

Validation results: https://addons.mozilla.org/en-US/developers/upload/0123456789abcdef0123456789abcdef
Downloading signed files: 100%
Downloaded:
    .\nothing-22.22.22.22-an+fx.xpi
The following signed files were downloaded:
[ 'C:\\sign-addon\\nothing-22.22.22.22-an+fx.xpi' ]
Your extension ID is:
nothing@eladkarako.com
SUCCESS
Press any key to continue . . .
</pre>
