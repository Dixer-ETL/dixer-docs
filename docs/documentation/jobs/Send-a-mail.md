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
- `attachments`: optional. Define attachments path of mail. Array string.
- `attachments_var`: optional. Variable with definition of attachments. Variable should be a string where the value is all attachments path separated by pipe `|`. String.

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
message_content = '<html>Hello World!</html>'
attachments = [
    'test/data/file.json',
    'test/data/file.xlsx',
]
```