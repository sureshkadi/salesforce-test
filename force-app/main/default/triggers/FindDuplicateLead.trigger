trigger FindDuplicateLead on Lead (Before insert) {
    system.debug('inside method');
    Boolean duplicateFlag = false;
    for(Lead l:Trigger.new)
    {
        List<Lead> lid = [select ID from Lead where Email =: l.Email];
        system.debug('dup list:::'+lid);
        if(lid.size() > 0)
        {
            l.Email = 'duplicate' + l.Email;
            l.is_duplicate__c = true;
        }	
    }
}