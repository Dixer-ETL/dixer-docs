# Send a mail

Dixer provides a way to send a mail with attachments and a lot of configurations. To do this use job type `mail`.

Keys:

- `connection_id`: mandatory. Connection ID of SMTP Connection. String.
- `display_name`: optional. Display name of the mail. String.
- `display_name_var`: optional. Variable with display name of the mail. String.
- `from_email`: optional. From of the mail. String.
- `from_email_var`: optional. Variable with From of the mail. String.
- `to`: optional. Recipients of the mail separate by semicolon `;`. String.
- `to_var`: optional. Variable with recipients of the mail. String.
- `cc`: optional. Recipients in CC of the mail separate by semicolon `;`. String.
- `cc_var`: optional. Variable with recipients in CC of the mail. String.
- `bcc`: optional. Recipients in BCC of the mail separate by semicolon `;`. String.
- `bcc_var`: optional. Variable with recipients in BCC of the mail. String.
- `reply_to`: optional. Reply To of the mail. String.
- `reply_to_var`: optional. Variable with Reply To of the mail. String.
- `subject`: optional. Subject of the mail. String.
- `subject_var`: optional. Variable with subject of the mail. String.
- `message_content`: optional. Content of the mail. String.
- `message_content_var`: optional. Variable with content of the mail. String.
- `is_html`: optional. Define if message content is html. Bool. Default `false`.
- `is_html_var`: optional. Variable with definition bool if message content is html. String.
- `allow_duplicate_addresses`: optional. To allow duplicate recipients in email. Bool.
- `allow_duplicate_addresses_var`: optional. Variable with the value of `allow_duplicate_addresses`. String.
- `attachments_v2`: optional. array object to add attachment, has the following keys:
    - `file_path`: optional. Path of attachment. String.
    - `file_path_var`: optional. Variable with value of `file_path`. String.
    - `base64`: optional. Base64 of the file to attach. String.
    - `base64_var`: optional. Variable with value of `base64`. String.
    - `file_name`: optional. Name of the attachment when is base64 or the `cid` of an inline attachment. String.
    - `file_name_var`: optional. Variable with value of `file_name`. String.
    - `inline`: optional. Define if attachment is a inline. Bool.
    - `inline_var`: optional. Variable with value of `inline`. String.
    - `mimetype`: optional. Mimetype of the attachment when is base64 or you want change the mimetype. String.
    - `mimetype_var`: optional. Variable with value of `mimetype`. String.


Example:

```toml
[[jobs]]
id = 'mail_send_job'
name = 'Send Mail'
type = 'mail'
disable = false
ignore_error = false
connection_id = '16'
display_name = 'Dixer'
from_email = 'test@example.com'
to = 'to@to.com;ta@to.com'
cc = 'cc@cc.ccom'
bcc = 'bcc@bcc.com'
reply_to = 'replyto@replyto.com'
is_html = true
subject = 'Hello World!'
message_content = '<html>Hello World!<p><img src="cid:test3.png" alt="test3" /><img src="cid:img1.jpg" alt="cat1" /></p><p><img src="cid:img2.jpg" alt="cat2" /></p></html>'

[[jobs.attachments_v2]]
file_path = 'test/in/csvdata1.csv'

[[jobs.attachments_v2]]
file_path = 'test/in/cat.jpg'
inline = true
file_name = 'img1.jpg'

[[jobs.attachments_v2]]
file_path = 'test/in/cat.jpg'
inline = true
file_name = 'img2.jpg'

[[jobs.attachments_v2]]
base64 = 'iVBORw0......'
file_name = "test.png"

[[jobs.attachments_v2]]
base64_var = "attachment_base64_v2"
file_name = "test2.png"

[[jobs.attachments_v2]]
base64_var = "attachment_base64_v2"
inline = true
file_name = "test3.png"
```

Example old way attachments (will be remved in v2.4.0):

Keys:

- `attachments`: optional. Define attachments path of mail. Array string.
- `attachments_var`: optional. Variable with definition of attachments. Variable should be a string where the value is all attachments path separated by pipe `|`. String.
- `attach_optional`: optional. To ignore empty attachments error. Bool.
- `attach_optional_var`: optional. Variable with the value of `attach_optional`. String.
- `attachments_base64`: optional. Define attachments base64 of mail. Array string.
- `attachments_base64_names`: mandatory if `attachments_base64` is set. Define attachments names of `attachments_base64` of mail. Array string.
- `inlines_base64`: optional. Define inlines base64 of mail. Array string.
- `inlines_base64_cid`: mandatory if `inlines_base64` is set. Define inlines cid of `inlines_base64` of mail. Array string.
- `attachments_base64_var`: optional. Variable with the value of `attachments_base64`. String.
- `attachments_base64_names_var`: optional. Variable with the value of `attachments_base64_names`. String.
- `inlines_base64_var`: optional. Variable with the value of `inlines_base64`. String.
- `inlines_base64_cid_var`: optional. Variable with the value of `inlines_base64_cid`. String.

```toml
[[jobs]]
id = 'mail_send_job'
name = 'Send Mail'
type = 'mail'
disable = false
ignore_error = false
connection_id = '16'
display_name = 'Dixer'
from_email = 'test@example.com'
to = 'to@to.com;ta@to.com'
cc = 'cc@cc.ccom'
bcc = 'bcc@bcc.com'
reply_to = 'replyto@replyto.com'
is_html = true
subject = 'Hello World!'
message_content = '<html>Hello World!</html>'
attachments = [
    'test/data/file.json',
    'test/data/file.xlsx',
]
attachments_base64 = [
    'BASE64 OF FILE 1',
    'BASE64 OF FILE 2',
]
attachments_base64_names = ['f1.png', 'f2.png']
```