require_dependency 'mail_handler'
require_dependency 'mailer'

module MailHandlerDisableCreateIssuePatch
    def self.included(base) # :nodoc:
        base.send(:include, InstanceMethods)

        base.class_eval do
            alias_method_chain :dispatch_to_default, :disable_create
        end
    end

    module InstanceMethods
        def dispatch_to_default_with_disable_create
            # Reply with canned message
            rcpt_to = email.from.to_a.first.to_s
            subject = "Re: #{email.subject.to_s}"
            message = Setting.plugin_redmine_disable_mail_create_issue[:reject_message]

            Mailer.new_issue_bounce(rcpt_to, subject, message).deliver
        end
    end
end

module MailerDisableCreateIssuePatch
    def self.included(base) # :nodoc:
        base.send(:include, InstanceMethods)
    end

    module InstanceMethods
        def new_issue_bounce(rcpt, subj, message)
            @body = message
            mail :to => rcpt, :subject => subj
        end
    end
end

MailHandler.send(:include, MailHandlerDisableCreateIssuePatch)
Mailer.send(:include, MailerDisableCreateIssuePatch)

