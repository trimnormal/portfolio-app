# # __generated__ by Terraform
# # Please review these resources and move them into your main configuration files.

# # __generated__ by Terraform
# resource "aws_route53_record" "A" {
#   allow_overwrite = null
#   health_check_id = null
#   #multivalue_answer_routing_policy = false
#   name = "zacharycorbishley.com"
#   #records                          = []
#   #set_identifier                   = null
#   #ttl                              = 0
#   type    = "A"
#   zone_id = "Z0869368318HH6SAHKT02"
#   alias {
#     evaluate_target_health = false
#     name                   = "d79xo71azf4ty.cloudfront.net"
#     zone_id                = "Z2FDTNDATAQYW2"
#   }
# }

# # __generated__ by Terraform
# resource "aws_route53_record" "SOA" {
#   allow_overwrite = null
#   health_check_id = null
#   #multivalue_answer_routing_policy = false
#   name    = "zacharycorbishley.com"
#   records = ["ns-1877.awsdns-42.co.uk. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
#   #set_identifier                   = null
#   ttl     = 900
#   type    = "SOA"
#   zone_id = "Z0869368318HH6SAHKT02"
# }

# # __generated__ by Terraform from "Z0869368318HH6SAHKT02"
# resource "aws_route53_zone" "this" {
#   comment           = "Managed by Terraform"
#   delegation_set_id = null
#   force_destroy     = null
#   name              = "zacharycorbishley.com"
#   tags              = {}
#   tags_all          = {}
# }

# # __generated__ by Terraform from "arn:aws:acm:us-east-1:953170553831:certificate/a8349f0f-7cf7-4f87-af97-50524d65b761"
# resource "aws_acm_certificate" "this" {
#   certificate_authority_arn = null
#   certificate_body          = null
#   certificate_chain         = null
#   domain_name               = "zacharycorbishley.com"
#   early_renewal_duration    = null
#   key_algorithm             = "RSA_2048"
#   private_key               = null # sensitive
#   subject_alternative_names = ["*.zacharycorbishley.com", "zacharycorbishley.com"]
#   tags                      = {}
#   tags_all                  = {}
#   validation_method         = "EMAIL"
#   options {
#     certificate_transparency_logging_preference = "ENABLED"
#   }
# }

# # __generated__ by Terraform from "E1NWCA3S7848DH"
# resource "aws_cloudfront_distribution" "domain" {
#   aliases                         = ["zacharycorbishley.com"]
#   comment                         = null
#   continuous_deployment_policy_id = null
#   default_root_object             = null
#   enabled                         = true
#   http_version                    = "http2"
#   is_ipv6_enabled                 = true
#   price_class                     = "PriceClass_All"
#   retain_on_delete                = false
#   staging                         = false
#   tags                            = {}
#   tags_all                        = {}
#   wait_for_deployment             = true
#   web_acl_id                      = null
#   default_cache_behavior {
#     allowed_methods            = ["GET", "HEAD"]
#     cache_policy_id            = null
#     cached_methods             = ["GET", "HEAD"]
#     compress                   = false
#     default_ttl                = 86400
#     field_level_encryption_id  = null
#     max_ttl                    = 31536000
#     min_ttl                    = 0
#     origin_request_policy_id   = null
#     realtime_log_config_arn    = null
#     response_headers_policy_id = null
#     smooth_streaming           = false
#     target_origin_id           = "S3-.zacharycorbishley.com"
#     trusted_key_groups         = []
#     trusted_signers            = []
#     viewer_protocol_policy     = "allow-all"
#     forwarded_values {
#       headers                 = ["Origin"]
#       query_string            = true
#       query_string_cache_keys = []
#       cookies {
#         forward           = "none"
#         whitelisted_names = []
#       }
#     }
#   }
#   origin {
#     connection_attempts      = 3
#     connection_timeout       = 10
#     domain_name              = "zacharycorbishley.com.s3-website-us-east-1.amazonaws.com"
#     origin_access_control_id = null
#     origin_id                = "S3-.zacharycorbishley.com"
#     origin_path              = null
#     custom_origin_config {
#       http_port                = 80
#       https_port               = 443
#       origin_keepalive_timeout = 5
#       origin_protocol_policy   = "http-only"
#       origin_read_timeout      = 30
#       origin_ssl_protocols     = ["TLSv1", "TLSv1.1", "TLSv1.2"]
#     }
#   }
#   restrictions {
#     geo_restriction {
#       locations        = []
#       restriction_type = "none"
#     }
#   }
#   viewer_certificate {
#     acm_certificate_arn            = "arn:aws:acm:us-east-1:953170553831:certificate/a8349f0f-7cf7-4f87-af97-50524d65b761"
#     cloudfront_default_certificate = false
#     iam_certificate_id             = null
#     minimum_protocol_version       = "TLSv1.1_2016"
#     ssl_support_method             = "sni-only"
#   }
# }

# # __generated__ by Terraform from "ELUG3EP5AKV2I"
# resource "aws_cloudfront_distribution" "www" {
#   aliases                         = ["www.zacharycorbishley.com"]
#   comment                         = null
#   continuous_deployment_policy_id = null
#   default_root_object             = "index.html"
#   enabled                         = true
#   http_version                    = "http2"
#   is_ipv6_enabled                 = true
#   price_class                     = "PriceClass_All"
#   retain_on_delete                = false
#   staging                         = false
#   tags                            = {}
#   tags_all                        = {}
#   wait_for_deployment             = true
#   web_acl_id                      = null
#   custom_error_response {
#     error_caching_min_ttl = 0
#     error_code            = 404
#     response_code         = 200
#     response_page_path    = "/404.html"
#   }
#   default_cache_behavior {
#     allowed_methods            = ["GET", "HEAD"]
#     cache_policy_id            = null
#     cached_methods             = ["GET", "HEAD"]
#     compress                   = true
#     default_ttl                = 31536000
#     field_level_encryption_id  = null
#     max_ttl                    = 31536000
#     min_ttl                    = 31536000
#     origin_request_policy_id   = null
#     realtime_log_config_arn    = null
#     response_headers_policy_id = null
#     smooth_streaming           = false
#     target_origin_id           = "S3-www.zacharycorbishley.com"
#     trusted_key_groups         = []
#     trusted_signers            = []
#     viewer_protocol_policy     = "redirect-to-https"
#     forwarded_values {
#       headers                 = []
#       query_string            = false
#       query_string_cache_keys = []
#       cookies {
#         forward           = "none"
#         whitelisted_names = []
#       }
#     }
#   }
#   origin {
#     connection_attempts      = 3
#     connection_timeout       = 10
#     domain_name              = "www.zacharycorbishley.com.s3-website-us-east-1.amazonaws.com"
#     origin_access_control_id = null
#     origin_id                = "S3-www.zacharycorbishley.com"
#     origin_path              = null
#     custom_origin_config {
#       http_port                = 80
#       https_port               = 443
#       origin_keepalive_timeout = 5
#       origin_protocol_policy   = "http-only"
#       origin_read_timeout      = 30
#       origin_ssl_protocols     = ["TLSv1", "TLSv1.1", "TLSv1.2"]
#     }
#   }
#   restrictions {
#     geo_restriction {
#       locations        = []
#       restriction_type = "none"
#     }
#   }
#   viewer_certificate {
#     acm_certificate_arn            = "arn:aws:acm:us-east-1:953170553831:certificate/a8349f0f-7cf7-4f87-af97-50524d65b761"
#     cloudfront_default_certificate = false
#     iam_certificate_id             = null
#     minimum_protocol_version       = "TLSv1.1_2016"
#     ssl_support_method             = "sni-only"
#   }
# }

# # __generated__ by Terraform
# resource "aws_route53_record" "NS" {
#   allow_overwrite = null
#   health_check_id = null
#   #multivalue_answer_routing_policy = false
#   name    = "zacharycorbishley.com"
#   records = ["ns-1041.awsdns-02.org.", "ns-1877.awsdns-42.co.uk.", "ns-65.awsdns-08.com.", "ns-816.awsdns-38.net."]
#   #set_identifier                   = null
#   ttl     = 172800
#   type    = "NS"
#   zone_id = "Z0869368318HH6SAHKT02"
# }

# # __generated__ by Terraform
# resource "aws_route53_record" "TXT" {
#   allow_overwrite = null
#   health_check_id = null
#   #multivalue_answer_routing_policy = false
#   name    = "zacharycorbishley.com"
#   records = ["google-site-verification=h88y-Owms-q-F27aOOJ0ajKO_Rc_AVc-Egbu2_rcRPc"]
#   #set_identifier                   = null
#   ttl     = 300
#   type    = "TXT"
#   zone_id = "Z0869368318HH6SAHKT02"
# }

# # __generated__ by Terraform
# resource "aws_route53_record" "wwwA" {
#   allow_overwrite = null
#   health_check_id = null
#   #multivalue_answer_routing_policy = false
#   name = "www.zacharycorbishley.com"
#   #records                          = []
#   #set_identifier                   = null
#   #ttl                              = 0
#   type    = "A"
#   zone_id = "Z0869368318HH6SAHKT02"
#   alias {
#     evaluate_target_health = false
#     name                   = "dlijm2si18v4t.cloudfront.net"
#     zone_id                = "Z2FDTNDATAQYW2"
#   }
# }
