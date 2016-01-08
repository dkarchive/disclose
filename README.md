# Disclose

Grab open-source project licenses :raising_hand: 

![](http://i.giphy.com/xTiTngQ7Gpakdpm4nu.gif)

Use `disclose` to put together those pesky open source license disclosures.

## Setup

```shell
git clone https://github.com/dkhamsing/disclose.git
cd disclose
rake install
# 🎉
```

`disclose` grabs licenses from a list of repos in a file using the GitHub API. Credentials need to be [set in .netrc](http://octokit.github.io/octokit.rb/#Using_a__netrc_file).

## Usage

```shell
$ disclose list        # grab licenses in plain text 
...

$ disclose list --html # grab licenses in HTML
License format: HTML
Scanning for GitHub repos in list, found...
Retrieving license for AFNetworking/AFNetworking
Retrieving license for jdg/MBProgressHUD
Retrieving license for thermogl/TITokenField
> Error: GET https://api.github.com/repos/thermogl/TITokenField/license: 404 - Not Found // See: https://developer.github.com/v3
Writing to licenses.json
```

## Credits

- [`octokit`, `netrc`](disclose.gemspec)
- [giphy](http://gph.is/1Oexz9a)

## Contact

- [github.com/dkhamsing](https://github.com/dkhamsing)
- [twitter.com/dkhamsing](https://twitter.com/dkhamsing)

## License

This project is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
