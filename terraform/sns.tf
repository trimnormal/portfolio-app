resource "aws_sns_topic" "message" {
  name = "zc-portfolio-app-topic"
}

resource "aws_sns_topic_subscription" "message" {
  confirmation_timeout_in_minutes = null
  delivery_policy                 = null
  endpoint                        = "zacharycorbishley@yahoo.com"
  endpoint_auto_confirms          = null
  filter_policy                   = null
  filter_policy_scope             = null
  protocol                        = "email"
  raw_message_delivery            = false
  redrive_policy                  = null
  replay_policy                   = null
  subscription_role_arn           = null
  topic_arn                       = "arn:aws:sns:us-east-1:953170553831:zc-portfolio-app-topic"
}
