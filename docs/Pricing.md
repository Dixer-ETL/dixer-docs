# Pricing

Dixer can be used without restrictions for any user, but execution has a delay of 30 seconds before initialize workflow. To avoid this delay consider buying depending the edition you need.

Here is the pricing model of Dixer based in editions:

| Edition                            | Price    | PayPal Link                          |
|------------------------------------|----------|--------------------------------------|
| [White](Editions.md#white-edition) | USD $149 | [Buy](https://www.paypal.me/hit/149) |
| [Sky](Editions.md#sky-edition)     | USD $159 | [Buy](https://www.paypal.me/hit/159) |
| [Red](Editions.md#red-edition)     | USD $199 | [Buy](https://www.paypal.me/hit/199) |
| [Green](Editions.md#green-edition) | USD $199 | [Buy](https://www.paypal.me/hit/199) |
| [Full](Editions.md#full-edition)   | USD $299 | [Buy](https://www.paypal.me/hit/299) |

License is only supported for `Windows`, `Linux` and `macOS` where the command flag `-genlicreq` works. In Linux, you need to execute with sudo or go [here](documentation/Getting-Dixer.md#using-a-non-root-account-for-dmidecode-only-if-you-have-a-license) to disable sudo in `dmidecode`.

The license should be generated with the owner information like this:

```bash
dixer -genlicreq -licreqname "Santiago De la Cruz" -licreqemail email@example.com -licreqcompany "My cool company name" -licrequrl https://stgo.do
```

A one-time payment license that includes one year of updates. If you need a new version after a year of the license, you need to buy another license.

When buy it, send a mail to [`support@stgo.do`](mailto:support@stgo.do) with license request generated from [Command line](documentation/Command-line.md) with option `-genlicreq` and include the transaction detail generated from PayPal. A reply will be sent with license file attached to it.

!!! tip
    Please try downloading a binay in [download page](Download.md) before buying a license.

!!! tip
    License file path can be set in environment variable `DIXER_LIC` to avoid use the `--license` option from command line. Also, you can set the content of the license file in environment variable `DIXER_LIC_RAW`.