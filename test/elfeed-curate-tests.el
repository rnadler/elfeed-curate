;;; elfeed-curate-tests.el --- Elfeed curate tests -*- lexical-binding: t; -*-

(require 'ert)
(require 'elfeed-curate)

(ert-deftest tag-to-group-name-test ()
  (should (string-equal (elfeed-curate-tag-to-group-name "") ""))
  (should (string-equal (elfeed-curate-tag-to-group-name 4) "4"))
  (should (string-equal (elfeed-curate-tag-to-group-name nil) "Nil"))
  (should (string-equal (elfeed-curate-tag-to-group-name '(one two three)) "(One Two Three)"))
  (should (string-equal (elfeed-curate-tag-to-group-name 'singleword) "Singleword"))
  (should (string-equal (elfeed-curate-tag-to-group-name 'this_is_four_words) "This Is Four Words")))

(defvar groups (list 'group1 '(a b c d) 'group2 `(x y z)))

(ert-deftest count-group-ertries-test ()
  (should (= 7 (elfeed-curate--group-entries-count groups))))

(ert-deftest normalize-tags-test ()
  (should (= 2 (length (elfeed-curate-normalize-tags (list 'soft 'Soft 'sofT 'med_dev 'med_Dev 'MED_Dev))))))

(provide 'elfeed-curate-tests)

;;; elfeed-curate-tests.el ends here
