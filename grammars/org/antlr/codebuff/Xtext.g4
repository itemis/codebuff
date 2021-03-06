/*
 * generated by Xtext 2.12.0
 */
grammar Xtext;

// Rule Grammar
ruleGrammar:
	'grammar'
	ruleGrammarID
	(
		'with'
		ruleGrammarID
		(
			','
			ruleGrammarID
		)*
	)?
	(
		'hidden'
		'('
		(
			ruleRuleID
			(
				','
				ruleRuleID
			)*
		)?
		')'
	)?
	ruleAbstractMetamodelDeclaration
	*
	ruleAbstractRule
	+
;

// Rule GrammarID
ruleGrammarID:
	ruleValidID
	(
		'.'
		ruleValidID
	)*
;

// Rule AbstractRule
ruleAbstractRule:
	(
		ruleParserRule
		    |
		ruleTerminalRule
		    |
		ruleEnumRule
	)
;

// Rule AbstractMetamodelDeclaration
ruleAbstractMetamodelDeclaration:
	(
		ruleGeneratedMetamodel
		    |
		ruleReferencedMetamodel
	)
;

// Rule GeneratedMetamodel
ruleGeneratedMetamodel:
	'generate'
	ruleValidID
	RULE_STRING
	(
		'as'
		ruleValidID
	)?
;

// Rule ReferencedMetamodel
ruleReferencedMetamodel:
	'import'
	RULE_STRING
	(
		'as'
		ruleValidID
	)?
;

// Rule Annotation
ruleAnnotation:
	'@'
	RULE_ID
;

// Rule ParserRule
ruleParserRule:
	ruleAnnotation
	?
	(
		'fragment'
		ruleRuleNameAndParams
		(
			'*'
			    |
			(
				'returns'
				ruleTypeRef
			)?
		)
		    |
		ruleRuleNameAndParams
		(
			'returns'
			ruleTypeRef
		)?
	)
	(
		'hidden'
		'('
		(
			ruleRuleID
			(
				','
				ruleRuleID
			)*
		)?
		')'
	)?
	':'
	ruleAlternatives
	';'
;

// Rule RuleNameAndParams
ruleRuleNameAndParams:
	ruleValidID
	(
		'<'
		(
			ruleParameter
			(
				','
				ruleParameter
			)*
		)?
		'>'
	)?
;

// Rule Parameter
ruleParameter:
	RULE_ID
;

// Rule TypeRef
ruleTypeRef:
	(
		RULE_ID
		'::'
	)?
	RULE_ID
;

// Rule Alternatives
ruleAlternatives:
	ruleConditionalBranch
	(
		(
			'|'
			ruleConditionalBranch
		)+
	)?
;

// Rule ConditionalBranch
ruleConditionalBranch:
	(
		ruleUnorderedGroup
		    |
		'<'
		ruleDisjunction
		'>'
		ruleAbstractToken
		+
	)
;

// Rule UnorderedGroup
ruleUnorderedGroup:
	ruleGroup
	(
		(
			'&'
			ruleGroup
		)+
	)?
;

// Rule Group
ruleGroup:
	ruleAbstractToken
	(
		ruleAbstractToken
		+
	)?
;

// Rule AbstractToken
ruleAbstractToken:
	(
		ruleAbstractTokenWithCardinality
		    |
		ruleAction
	)
;

// Rule AbstractTokenWithCardinality
ruleAbstractTokenWithCardinality:
	(
		ruleAssignment
		    |
		ruleAbstractTerminal
	)
	(
		'?'
		    |
		'*'
		    |
		'+'
	)?
;

// Rule Action
ruleAction:
	'{'
	ruleTypeRef
	(
		'.'
		ruleValidID
		(
			'='
			    |
			'+='
		)
		'current'
	)?
	'}'
;

// Rule AbstractTerminal
ruleAbstractTerminal:
	(
		ruleKeyword
		    |
		ruleRuleCall
		    |
		ruleParenthesizedElement
		    |
		rulePredicatedKeyword
		    |
		rulePredicatedRuleCall
		    |
		rulePredicatedGroup
	)
;

// Rule Keyword
ruleKeyword:
	RULE_STRING
;

// Rule RuleCall
ruleRuleCall:
	ruleRuleID
	(
		'<'
		ruleNamedArgument
		(
			','
			ruleNamedArgument
		)*
		'>'
	)?
;

// Rule NamedArgument
ruleNamedArgument:
	(
		RULE_ID
		'='
	)?
	ruleDisjunction
;

// Rule LiteralCondition
ruleLiteralCondition:
	(
		'true'
		    |
		'false'
	)
;

// Rule Disjunction
ruleDisjunction:
	ruleConjunction
	(
		'|'
		ruleConjunction
	)*
;

// Rule Conjunction
ruleConjunction:
	ruleNegation
	(
		'&'
		ruleNegation
	)*
;

// Rule Negation
ruleNegation:
	(
		ruleAtom
		    |
		'!'
		ruleNegation
	)
;

// Rule Atom
ruleAtom:
	(
		ruleParameterReference
		    |
		ruleParenthesizedCondition
		    |
		ruleLiteralCondition
	)
;

// Rule ParenthesizedCondition
ruleParenthesizedCondition:
	'('
	ruleDisjunction
	')'
;

// Rule ParameterReference
ruleParameterReference:
	RULE_ID
;

// Rule TerminalRuleCall
ruleTerminalRuleCall:
	ruleRuleID
;

// Rule RuleID
ruleRuleID:
	ruleValidID
	(
		'::'
		ruleValidID
	)*
;

// Rule ValidID
ruleValidID:
	(
		RULE_ID
		    |
		'true'
		    |
		'false'
	)
;

// Rule PredicatedKeyword
rulePredicatedKeyword:
	(
		'=>'
		    |
		'->'
	)
	RULE_STRING
;

// Rule PredicatedRuleCall
rulePredicatedRuleCall:
	(
		'=>'
		    |
		'->'
	)
	ruleRuleID
	(
		'<'
		ruleNamedArgument
		(
			','
			ruleNamedArgument
		)*
		'>'
	)?
;

// Rule Assignment
ruleAssignment:
	(
		'=>'
		    |
		'->'
	)?
	ruleValidID
	(
		'+='
		    |
		'='
		    |
		'?='
	)
	ruleAssignableTerminal
;

// Rule AssignableTerminal
ruleAssignableTerminal:
	(
		ruleKeyword
		    |
		ruleRuleCall
		    |
		ruleParenthesizedAssignableElement
		    |
		ruleCrossReference
	)
;

// Rule ParenthesizedAssignableElement
ruleParenthesizedAssignableElement:
	'('
	ruleAssignableAlternatives
	')'
;

// Rule AssignableAlternatives
ruleAssignableAlternatives:
	ruleAssignableTerminal
	(
		(
			'|'
			ruleAssignableTerminal
		)+
	)?
;

// Rule CrossReference
ruleCrossReference:
	'['
	ruleTypeRef
	(
		'|'
		ruleCrossReferenceableTerminal
	)?
	']'
;

// Rule CrossReferenceableTerminal
ruleCrossReferenceableTerminal:
	(
		ruleKeyword
		    |
		ruleRuleCall
	)
;

// Rule ParenthesizedElement
ruleParenthesizedElement:
	'('
	ruleAlternatives
	')'
;

// Rule PredicatedGroup
rulePredicatedGroup:
	(
		'=>'
		    |
		'->'
	)
	'('
	ruleAlternatives
	')'
;

// Rule TerminalRule
ruleTerminalRule:
	ruleAnnotation
	?
	'terminal'
	(
		'fragment'
		ruleValidID
		    |
		ruleValidID
		(
			'returns'
			ruleTypeRef
		)?
	)
	':'
	ruleTerminalAlternatives
	';'
;

// Rule TerminalAlternatives
ruleTerminalAlternatives:
	ruleTerminalGroup
	(
		(
			'|'
			ruleTerminalGroup
		)+
	)?
;

// Rule TerminalGroup
ruleTerminalGroup:
	ruleTerminalToken
	(
		ruleTerminalToken
		+
	)?
;

// Rule TerminalToken
ruleTerminalToken:
	ruleTerminalTokenElement
	(
		'?'
		    |
		'*'
		    |
		'+'
	)?
;

// Rule TerminalTokenElement
ruleTerminalTokenElement:
	(
		ruleCharacterRange
		    |
		ruleTerminalRuleCall
		    |
		ruleParenthesizedTerminalElement
		    |
		ruleAbstractNegatedToken
		    |
		ruleWildcard
		    |
		ruleEOF
	)
;

// Rule ParenthesizedTerminalElement
ruleParenthesizedTerminalElement:
	'('
	ruleTerminalAlternatives
	')'
;

// Rule AbstractNegatedToken
ruleAbstractNegatedToken:
	(
		ruleNegatedToken
		    |
		ruleUntilToken
	)
;

// Rule NegatedToken
ruleNegatedToken:
	'!'
	ruleTerminalTokenElement
;

// Rule UntilToken
ruleUntilToken:
	'->'
	ruleTerminalTokenElement
;

// Rule Wildcard
ruleWildcard:
	'.'
;

// Rule EOF
ruleEOF:
	'EOF'
;

// Rule CharacterRange
ruleCharacterRange:
	ruleKeyword
	(
		'..'
		ruleKeyword
	)?
;

// Rule EnumRule
ruleEnumRule:
	ruleAnnotation
	?
	'enum'
	ruleValidID
	(
		'returns'
		ruleTypeRef
	)?
	':'
	ruleEnumLiterals
	';'
;

// Rule EnumLiterals
ruleEnumLiterals:
	ruleEnumLiteralDeclaration
	(
		(
			'|'
			ruleEnumLiteralDeclaration
		)+
	)?
;

// Rule EnumLiteralDeclaration
ruleEnumLiteralDeclaration:
	RULE_ID
	(
		'='
		ruleKeyword
	)?
;

RULE_ID : '^'? ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'_'|'0'..'9')*;

RULE_INT : ('0'..'9')+;

RULE_STRING : '"' .*? '"' | '\'' .*? '\''
              ;

RULE_ML_COMMENT : '/*' .*? ('*/' | EOF)  -> channel(HIDDEN);

RULE_SL_COMMENT : '//' ~[\r\n]*  -> channel(HIDDEN);

RULE_WS : [ \t\r\n\f]+ -> channel(HIDDEN)	;


RULE_ANY_OTHER : .;
