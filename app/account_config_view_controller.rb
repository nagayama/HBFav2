# -*- coding: utf-8 -*-
class AccountConfigViewController < Formotion::FormController
  def init
    if self
      form = Formotion::Form.new({
        sections: [{
              title: "はてなID",
              rows: [
                {
                  title: "ID",
                  key: "hatena_id",
                  type: :string,
                  placeholder: '必須',
                  auto_correction: :no,
                  auto_capitalization: :none,
                },
                {
                  title: "パスワード",
                  key: "password",
                  type: :string,
                  secure: true
                }
              ]
            }]
      })
      return self.class.alloc.initWithForm(form)
    end
  end

  def viewDidLoad
    super

    self.navigationItem.title = "設定"
    self.view.backgroundColor = UIColor.groupTableViewBackgroundColor

    self.navigationItem.rightBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(
      UIBarButtonSystemItemSave,
      target:self,
      action:'save'
    )

    self.navigationItem.leftBarButtonItem  = UIBarButtonItem.alloc.initWithBarButtonSystemItem(
      UIBarButtonSystemItemCancel,
      target:self,
      action:'cancel'
    )
  end

  def cancel
    self.dismissModalViewControllerAnimated(true)
  end

  def save
    data = self.form.render

    ## なんでキーが string なんだ･･･
    puts data["hatena_id"]
    puts data["password"]

    self.dismissModalViewControllerAnimated(true)
  end
end
