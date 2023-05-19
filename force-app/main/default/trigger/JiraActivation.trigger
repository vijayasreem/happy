trigger JiraActivation on Account (after insert, after update) {
	// Get list of Account records
	List<Account> updatedAccounts = Trigger.new;
	
	// Create map of JIRA credentials
	Map<String, String> jiraCredsMap = new Map<String,String>();
	
	// Iterate through Accounts
	for (Account acct : updatedAccounts) {
		// Check if the JIRA credentials are provided
		if(acct.Jira_Username__c != null && acct.Jira_Password__c != null) {
			//Add credentials to map
			jiraCredsMap.put(acct.Jira_Username__c, acct.Jira_Password__c);
		}
	}
	
	// Call the JIRA Activation method
	JIRA.activateJIRA(jiraCredsMap);
}