;;; gitlab-ci-mode-test-flycheck.el --- -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2017 Joe Wreschnig
;;
;; Author: Joe Wreschnig
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 2 of the License, or
;; (at your option) any later version.


;;; Commentary:
;;
;; This file contains test cases for ‘gitlab-ci-mode-flycheck’.  Unless
;; you’re hacking on it you shouldn’t need to edit or run this file.


;;; Code:

(require 'ert)
(require 'gitlab-ci-mode-flycheck)

(defconst test-contents
  "# Test buffer
test:
  stage: test
  script:
    - make")

(defmacro with-test-buffer (contents &rest body)
  "Create a buffer with CONTENTS and evaluate BODY with it."
  (declare (indent 1))
  `(with-temp-buffer
     (rename-buffer ".gitlab-ci.yml")
     (insert ,contents)
     ,@body))

(ert-deftest gitlab-ci-mode-flycheck-test-line-for-message ()
  (with-test-buffer test-contents
    (should (equal 4 (gitlab-ci-mode-flycheck--line-for-message
                      "jobs:test problem in keys: script")))
    (should (equal 3 (gitlab-ci-mode-flycheck--line-for-message
                      "jobs:test:stage config is sketchy")))))

(ert-deftest gitlab-ci-mode-flycheck-test-line-for-message-partial ()
  (with-test-buffer test-contents
    (should (equal 2 (gitlab-ci-mode-flycheck--line-for-message
                      "jobs:test:missing config is sketchy")))))

(ert-deftest gitlab-ci-mode-flycheck-test-line-for-message-missing ()
  (with-test-buffer test-contents
    (should (equal 1 (gitlab-ci-mode-flycheck--line-for-message
                      "jobs:unknown:key config is invalid")))))
  
(ert-deftest gitlab-ci-mode-flycheck-test-line-for-message-no-match ()
  (with-test-buffer test-contents
    (should (equal 1 (gitlab-ci-mode-flycheck--line-for-message
                      "an unhelpful error message")))))
  

;;; gitlab-ci-mode-flycheck-test.el ends here
