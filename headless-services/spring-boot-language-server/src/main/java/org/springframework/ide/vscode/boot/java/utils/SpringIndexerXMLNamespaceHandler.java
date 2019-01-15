/*******************************************************************************
 * Copyright (c) 2019 Pivotal, Inc.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     Pivotal, Inc. - initial API and implementation
 *******************************************************************************/
package org.springframework.ide.vscode.boot.java.utils;

import javax.xml.stream.events.StartElement;

import org.springframework.ide.vscode.commons.java.IJavaProject;

/**
 * @author Martin Lippert
 */
public interface SpringIndexerXMLNamespaceHandler {

	void processStartElement(IJavaProject project, String docURI, StartElement startElement, SymbolHandler handler);

}
