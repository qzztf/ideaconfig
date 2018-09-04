select apply_no               "applyNo",
       product_name           "productName",
       product_id             "productId",
       sales_user_name        "salesUserName",
       buyer_name             "buyerName",
       partner_bank_name      "partnerBankName",
       partner_insurance_name "partnerInsuranceName",
       seller_name            "sellerName",
       product_term           "productTerm",
       house_area             "houseArea",
       house_address          "houseAddress",
       house_no               "houseNo",
       tail_release_node      "tailReleaseNode",
       ransom_borrow_amount   "ransomBorrowAmount",
       new_loan_bank_name     "newLoanBankName",
       biz_loan_amount        "bizLoanAmount",
       turnover_amount        "turnoverAmount",
       borrowing_amount       "borrowingAmount",
       version                "version",
       guarantee_amount       "guaranteeAmount",
       down_payment_amount    "downPaymentAmount",
       tail_amount            "tailAmount"
from (select t1.apply_no,
             t1.product_name,
             t1.product_id,
             t1.sales_user_name,
             t1.partner_bank_name,
             t1.partner_insurance_name,
t1.man_check_first,
             t1.version
      from biz_apply_order t1
      where t1.apply_no = ?)as main0
       NATURAL LEFT JOIN (SELECT GROUP_CONCAT(f.name) as seller_name,
                                 GROUP_CONCAT(f.name) as buyer_name,
                                 e.apply_no           as apply_no
                          from biz_customer_rel as e
                                 LEFT JOIN biz_customer as f on e.customer_no = f.cust_no
                          where e.is_proposer = "Y"
                            and e.apply_no = ?)as main13
       NATURAL LEFT JOIN (SELECT a.product_term as product_term from biz_fee_summary as a where a.apply_no = ?)as main4
       NATURAL LEFT JOIN (SELECT t1.tail_release_node from biz_isr_mixed t1 where t1.apply_no = ? limit 1)as main8
       NATURAL LEFT JOIN (SELECT t1.ransom_borrow_amount,
                                 t1.turnover_amount,
                                 t1.borrowing_amount,
                                 t1.guarantee_amount,
                                 t1.down_payment_amount,
                                 t1.tail_amount
                          from biz_fee_summary t1,
                               biz_apply_order t2
                          where t1.apply_no = t2.apply_no
                            and t2.apply_no = ?
                          limit 1)as main9
       NATURAL LEFT JOIN (select t1.house_area, t1.house_address
                          from biz_house t1,
                               biz_apply_order t2
                          where t1.house_no = t2.house_no
                            and t2.apply_no = ?
                          limit 1) as main1
       NATURAL LEFT JOIN (select t1.house_no, t1.new_loan_bank_name, t1.biz_loan_amount
                          from biz_new_loan t1,
                               biz_apply_order t2
                          where t1.house_no = t2.house_no
                            and t2.apply_no = ?
                          limit 1)as main2
       NATURAL LEFT JOIN (SELECT t1.new_loan_bank_name, t1.biz_loan_amount
                          from biz_new_loan t1,
                               biz_apply_order t2
                          where t1.house_no = t2.house_no
                            and t2.apply_no = ?
                          limit 1)as main10