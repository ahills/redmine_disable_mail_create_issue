require_dependency 'mail_handler'

module MailHandlerDisableCreateIssuePatch
    def self.included(base) # :nodoc:
        base.send(:include, InstanceMethods)

        base.class_eval do
            alias_method_chain :dispatch_to_default, :disable_create
        end
    end

    module InstanceMethods
        def dispatch_to_default_with_disable_create
            project = target_project
            Rails.logger.error "> project: #{project}"
            #sender_email = email.from.to_a.first.to_s.strip
            Rails.logger.error "> email: #{email.from.to_s}"
            Rails.logger.error "> subject: #{email.subject.to_s}"
        end
    end
end

MailHandler.send(:include, MailHandlerDisableCreateIssuePatch)

