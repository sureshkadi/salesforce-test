trigger LeadUpsertTrigger on Lead (after insert) {

    for(Lead l : trigger.new){
        String email = l.Email.replace('duplicate','').trim();
           system.debug('after trigger lead:::'+l);
        List<Lead> lid = [select ID from Lead where Email =: email];
        system.debug('dup list:::'+lid);
        
        if(lid.size()>0){
          Lead extLead = lid.get(0);
            extLead.FirstName = l.FirstName;
            extLead.Status = 'Closed - Converted';
            extLead.LeadSource='&&&&&';
            system.debug('updated original lead:::'+l);
            //delete l;
             system.debug('deleted:::');
            update extLead;
            system.debug('updated original lead::'+extLead);
        }
        
    }
}