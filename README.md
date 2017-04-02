# cloudforms-api

=> Example: Show CloudForms Objects
. ./rhlab.env
./get_objects.sh
{
    "collections": [
        {
            "description": "Arbitration Profiles",
            "href": "https://cloudforms.rhlab.ch/api/arbitration_profiles",
            "name": "arbitration_profiles"
        },
        {
            "description": "Arbitration Rules",
            "href": "https://cloudforms.rhlab.ch/api/arbitration_rules",
            "name": "arbitration_rules"
....

=> Example: List Users
. ./rhlab.env
./get_users.sh

created_on: 2016-08-18T09:11:31Z
current_group_id: 1000000000016
href: https://cloudforms.rhlab.ch/api/users/1000000000002
id: 1000000000002
name: Consumption Administrator
settings: {}
updated_on: 2016-08-18T09:11:31Z
userid: consumption_admin

=> Example: Add Users
./add_user.sh test§
{
    "results": [
        {
            "created_on": "2017-04-02T15:18:29Z",
            "current_group_id": 1000000000002,
            "id": 1000000000016,
            "name": "Test User",
            "settings": {},
            "updated_on": "2017-04-02T15:18:29Z",
            "userid": "test\u00a7"
        }
    ]
}

=> Example: Delete USer
{
    "results": [
        {
            "href": "https://cloudforms.rhlab.ch/api/users/1000000000015",
            "message": "users id: 1000000000015 deleting",
            "success": true
        }
    ]
}

