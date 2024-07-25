import {
  to = aws_acm_certificate.this
  id = "arn:aws:acm:us-east-1:953170553831:certificate/a8349f0f-7cf7-4f87-af97-50524d65b761"
}

import {
  to = aws_cloudfront_distribution.www
  id = "ELUG3EP5AKV2I"
}

import {
  to = aws_cloudfront_distribution.domain
  id = "E1NWCA3S7848DH"
}

import {
  to = aws_route53_zone.this
  id = "Z0869368318HH6SAHKT02"
}

